document.addEventListener('DOMContentLoaded', function () {
    const barColors = ['#E04543', '#F9E61E', '#D0E16B', '#23B7C3', 'ACCE79'];

    const expenseData = {
        labels: [],
        datasets: [{
            label: 'Valor (R$)',
            data: [],
            backgroundColor: barColors,
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1
        }]
    };

    const ctx = document.getElementById('expenseChart').getContext('2d');
    const expenseChart = new Chart(ctx, {
        type: 'bar',
        data: expenseData,
        options: {
            scales: {
                x: {
                    beginAtZero: true,
                },
                y: {
                    beginAtZero: true,
                    ticks: {
                        callback: function (value) {
                            return 'R$ ' + value.toFixed(2);
                        }
                    }
                }
            },
            barThickness: 40
        }
    });

    function addExpense() {
        const expenseInput = document.getElementById('expense');
        const amountInput = document.getElementById('amount');
        const dateInput = document.getElementById('date');

        const expense = expenseInput.value;
        const amount = parseFloat(amountInput.value);
        const date = dateInput.value;

        if (expense && !isNaN(amount) && date) {
            const existingExpenseIndex = expenseChart.data.labels.findIndex(label => label.startsWith(expense + ' (' + date + ')'));

            if (existingExpenseIndex !== -1) {
                expenseChart.data.datasets[0].data[existingExpenseIndex] += amount;
            } else {
                expenseChart.data.labels.push(expense + ' (' + date + ')');
                expenseChart.data.datasets[0].data.push(amount);
            }

            expenseChart.update();

            expenseInput.value = '';
            amountInput.value = '';

            calculateDailyTotals();
        }
    }

    function calculateDailyTotals() {
        const labels = expenseChart.data.labels;
        const data = expenseChart.data.datasets[0].data;
        const dailyTotals = {};

        for (let i = 0; i < labels.length; i++) {
            const labelParts = labels[i].split(' ');
            const date = labelParts[labelParts.length - 1].slice(1, -1);
            const amount = data[i];
            const expense = labelParts.slice(0, -1).join(' ');

            if (dailyTotals[date]) {
                dailyTotals[date].push({ expense, amount });
            } else {
                dailyTotals[date] = [{ expense, amount }];
            }
        }

        updateExpenseTable(dailyTotals);
    }

    function updateExpenseTable(dailyTotals) {
        const tbody = document.querySelector('#expenseTable tbody');
        tbody.innerHTML = '';

        for (const date in dailyTotals) {
            dailyTotals[date].forEach(item => {
                const row = document.createElement('tr');
                const expenseCell = document.createElement('td');
                const dateCell = document.createElement('td');
                const totalCell = document.createElement('td');

                expenseCell.textContent = item.expense;
                dateCell.textContent = date;
                totalCell.textContent = item.amount.toFixed(2);

                row.appendChild(expenseCell);
                row.appendChild(dateCell);
                row.appendChild(totalCell);
                tbody.appendChild(row);
            });
        }
    }

    const addButton = document.getElementById('addExpense');
    addButton.addEventListener('click', addExpense);

    const downloadButton = document.getElementById('downloadButton'); 
    downloadButton.addEventListener('click', function () {
        html2canvas(document.getElementById('expenseChart')).then(function (canvas) {
            const link = document.createElement('a');
            link.href = canvas.toDataURL('image/png');
            link.download = 'grafico.png';
            link.click();
        });
    });

    calculateDailyTotals();
});
