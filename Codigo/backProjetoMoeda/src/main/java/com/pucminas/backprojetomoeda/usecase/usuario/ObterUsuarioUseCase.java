package com.pucminas.backprojetomoeda.usecase.usuario;


import com.pucminas.backprojetomoeda.common.enums.TipoUsuario;
import com.pucminas.backprojetomoeda.common.mapper.Mapper;
import com.pucminas.backprojetomoeda.core.usuario.UsuarioService;
import com.pucminas.backprojetomoeda.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ObterUsuarioUseCase {

    @Autowired
    UsuarioService usuarioService;

    @Autowired
    Mapper mapper;

    public Usuario obterUsuarioPorId(String matricula, String senha) {
        return usuarioService.login(matricula, senha);
    }

    public List<Usuario> obterUsuarioPorTipoAcesso(TipoUsuario acesso) {
        return usuarioService.buscarUsuarioPorTipoAcesso(acesso);
    }
}
