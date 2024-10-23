package com.pucminas.backprojetomoeda.usecase.usuario;


import com.pucminas.backprojetomoeda.common.mapper.Mapper;
import com.pucminas.backprojetomoeda.core.usuario.UsuarioService;
import com.pucminas.backprojetomoeda.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SalvarNovoUsuarioUseCase {

    @Autowired
    UsuarioService usuarioService;

    @Autowired
    Mapper mapper;

    public Usuario salvarNovoUsuario(Usuario usuario) {
        return usuarioService.salvarUsuario(usuario);
    }

}
