package br.spendwise.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.spendwise.model.domain.Usuario;

public class UsuarioDAO {
    public void criarTabela() {
        String sql = "CREATE TABLE IF NOT EXISTS usuarios(id integer PRIMARY KEY AUTOINCREMENT, nome varchar(40), email varchar(40), senha varchar(30))";
        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void inserir(Usuario usuarios) {
        String sql = "INSERT INTO usuarios(nome,email,senha) values (?,?,?)";
        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.setString(1, usuarios.getNome());
            stmt.setString(2, usuarios.getEmail());
            stmt.setString(3, usuarios.getSenha());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void excluir(Integer id) {
        String sql = "DELETE FROM usuarios WHERE id=?";
        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void alterar(Usuario usuarios) {
        String sql = "UPDATE usuarios SET nome=?, email=?, senha=? WHERE id=?";
        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.setString(1, usuarios.getNome());
            stmt.setString(2, usuarios.getEmail());
            stmt.setString(3, usuarios.getSenha());
            stmt.setInt(4, usuarios.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Usuario> listar() {
        ArrayList<Usuario> usuario = new ArrayList<>();
        String sql = "SELECT * FROM usuarios";
        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario(rs.getInt("id"), rs.getString("nome"), rs.getString("email"),
                        rs.getString("senha"));
                usuario.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    public Usuario pesquisarPorId(Integer id) {
        Usuario usuarios = null;
        String sql = "SELECT * FROM usuarios WHERE id=?";
        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                usuarios = new Usuario(rs.getInt("id"), rs.getString("nome"), rs.getString("email"),
                        rs.getString("senha"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuarios;
    }

    public Usuario autenticacao(Usuario usuario) {
        Usuario usuarios = null;
        String sql = "SELECT * FROM usuarios WHERE email=? and senha=?";
        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.setString(1, usuario.getEmail());
            stmt.setString(2, usuario.getSenha());
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                usuarios = new Usuario(rs.getInt("id"), rs.getString("nome"), rs.getString("email"),
                        rs.getString("senha"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuarios;
    }
}
