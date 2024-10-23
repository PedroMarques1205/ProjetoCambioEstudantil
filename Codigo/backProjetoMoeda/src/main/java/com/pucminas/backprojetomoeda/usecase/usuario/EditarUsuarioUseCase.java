package com.pucminas.backprojetomoeda.usecase.usuario;

import com.pucminas.backprojetomoeda.common.mapper.Mapper;
import com.pucminas.backprojetomoeda.core.usuario.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class EditarUsuarioUseCase {

    @Autowired
    UsuarioService usuarioService;

    @Autowired
    Mapper mapper;

//    public UsuarioDTO editarUsuario(RequestEditarUsuarioDTO params) {
//        Usuario usuarioSalvo = usuarioService.editarUsuario(params);
//        return mapper.generalMapper(usuarioSalvo,UsuarioDTO.class);
//    }
}
