package br.spendwise.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.spendwise.model.domain.Receita;
import br.spendwise.model.domain.Usuario;

public class ReceitaDAO {
    public void criarTabela() {
        String sql = "CREATE TABLE IF NOT EXISTS receitas(id integer PRIMARY KEY AUTOINCREMENT, valor float, data date, idusuario integer, descricao varchar(40), tipo varchar(20), FOREIGN KEY(idusuario) REFERENCES usuarios(id))";
        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void inserir(Receita receitas) {
        String sql = "INSERT INTO receitas(valor,data,idusuario,tipo,descricao) values (?,?,?,?,?)";
        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.setDouble(1, receitas.getValor());
            stmt.setString(2, receitas.getData());
            stmt.setInt(3, receitas.getUsuario().getId());
            stmt.setString(4, receitas.getTipo());
            stmt.setString(5, receitas.getDescricao());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void excluir(Integer id) {
        String sql = "DELETE FROM receitas WHERE id=?";
        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void alterar(Receita receitas) {
        String sql = "UPDATE receitas SET valor=?, data=?, descricao=? WHERE id=?";
        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.setDouble(1, receitas.getValor());
            stmt.setString(2, receitas.getData());
            stmt.setString(3, receitas.getDescricao());
            stmt.setInt(4, receitas.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Receita> listar() {
        ArrayList<Receita> receita = new ArrayList<>();
        String sql = "SELECT * FROM receitas";
        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                UsuarioDAO udao = new UsuarioDAO();
                Usuario u = udao.pesquisarPorId(rs.getInt("idusuario"));
                Receita r = new Receita(rs.getInt("id"), rs.getDouble("valor"), rs.getString("data"), u,
                        rs.getString("tipo"), rs.getString("descricao"));
                receita.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return receita;
    }

    public Receita pesquisarPorId(Integer id) {
        Receita receitas = null;
        String sql = "SELECT * FROM receitas WHERE id = ?";
        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                UsuarioDAO udao = new UsuarioDAO();
                Usuario u = udao.pesquisarPorId(rs.getInt("idusuario"));
                receitas = new Receita(rs.getInt("id"), rs.getDouble("valor"), rs.getString("data"), u,
                        rs.getString("tipo"), rs.getString("descricao"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return receitas;
    }
}
