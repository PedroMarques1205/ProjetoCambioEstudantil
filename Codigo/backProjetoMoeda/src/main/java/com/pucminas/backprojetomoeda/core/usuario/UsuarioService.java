    package com.pucminas.backprojetomoeda.core.usuario;


    import com.pucminas.backprojetomoeda.common.enums.TipoUsuario;
    import com.pucminas.backprojetomoeda.dataprovider.usuario.IUsuarioRepository;
    import com.pucminas.backprojetomoeda.model.Usuario;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Service;

    import java.util.List;

    @Service
    public class UsuarioService {

        @Autowired
        IUsuarioRepository usuarioRepository;

        public Usuario salvarUsuario(Usuario usuario) {
            return usuarioRepository.save(usuario);
        }

        public Usuario deletarUsuario(String matricula) {
            if(usuarioRepository.findById(matricula).isPresent()) {
                Usuario usuario = usuarioRepository.findById(matricula).get();
                usuario.setAtivo(false);
                usuarioRepository.save(usuario);

                return usuario;
            }
            return null;
        }

        public Usuario login(String matricula, String Senha) {
            if(usuarioRepository.findById(matricula).isPresent()) {
                if(usuarioRepository.findById(matricula).get().getSenha().equals(Senha)) {
                    return usuarioRepository.findById(matricula).get();
                }
            }
            return null;
        }

        public List<Usuario> buscarUsuarioPorTipoAcesso(TipoUsuario acesso) {
            return usuarioRepository.findByTipoAcesso(acesso).stream()
                    .filter(Usuario::isAtivo)
                    .toList();
        }

        public Usuario buscarUsuarioPorEmail(String email) {
            return usuarioRepository.findById(email).orElse(null);
        }

        public Usuario editarUsuario(String email, Usuario usuarioAtualizado) {
            return usuarioRepository.findById(email).map(usuarioExistente -> {
                usuarioExistente.setCpf(usuarioAtualizado.getCpf());
                usuarioExistente.setCnpj(usuarioAtualizado.getCnpj());
                usuarioExistente.setRg(usuarioAtualizado.getRg());
                usuarioExistente.setEndereco(usuarioAtualizado.getEndereco());
                usuarioExistente.setNome(usuarioAtualizado.getNome());
                usuarioExistente.setSenha(usuarioAtualizado.getSenha());
                usuarioExistente.setTipoAcesso(usuarioAtualizado.getTipoAcesso());
                usuarioExistente.setAtivo(usuarioAtualizado.isAtivo());
                usuarioExistente.setSaldoMoedas(usuarioAtualizado.getSaldoMoedas());

                return usuarioRepository.save(usuarioExistente);
            }).orElse(null);
        }
    }
