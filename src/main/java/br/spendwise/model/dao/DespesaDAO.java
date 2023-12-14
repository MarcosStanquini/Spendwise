package br.spendwise.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.spendwise.model.domain.Despesa;
import br.spendwise.model.domain.Usuario;

public class DespesaDAO {
    public void criarTabela() {
        String sql = "CREATE TABLE IF NOT EXISTS despesas(id integer PRIMARY KEY AUTOINCREMENT, valor float, data date, idusuario integer, descricao varchar(40), tipo varchar(20), FOREIGN KEY(idusuario) REFERENCES usuarios(id))";
        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void inserir(Despesa despesas) {
        String sql = "INSERT INTO despesas(valor,data,idusuario,tipo,descricao) values (?,?,?,?,?)";
        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.setDouble(1, despesas.getValor());
            stmt.setString(2, despesas.getData());
            stmt.setInt(3, despesas.getUsuario().getId());
            stmt.setString(4, despesas.getTipo());
            stmt.setString(5, despesas.getDescricao());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void excluir(Integer id) {
        String sql = "DELETE FROM despesas WHERE id=?";
        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void alterar(Despesa despesas) {
        String sql = "UPDATE despesas SET valor=?, data=?, descricao=? WHERE id=?";
        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.setDouble(1, despesas.getValor());
            stmt.setString(2, despesas.getData());
            stmt.setString(3, despesas.getDescricao());
            stmt.setInt(4, despesas.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Despesa> listar() {
        ArrayList<Despesa> Despesa = new ArrayList<>();
        String sql = "SELECT * FROM despesas";
        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                UsuarioDAO udao = new UsuarioDAO();
                Usuario u = udao.pesquisarPorId(rs.getInt("idusuario"));
                Despesa d = new Despesa(rs.getInt("id"), rs.getDouble("valor"), rs.getString("data"), u,
                        rs.getString("tipo"), rs.getString("descricao"));
                Despesa.add(d);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Despesa;
    }

    public Despesa pesquisarPorId(Integer id) {
        Despesa despesas = null;
        String sql = "SELECT * FROM despesas WHERE id = ?";
        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                UsuarioDAO udao = new UsuarioDAO();
                Usuario u = udao.pesquisarPorId(rs.getInt("idusuario"));
                despesas = new Despesa(rs.getInt("id"), rs.getDouble("valor"), rs.getString("data"), u,
                        rs.getString("tipo"), rs.getString("descricao"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return despesas;
    }
}
