package com.pucminas.backprojetomoeda.entrypoint.usuario;

import com.pucminas.backprojetomoeda.common.enums.TipoUsuario;
import com.pucminas.backprojetomoeda.core.usuario.UsuarioService;
import com.pucminas.backprojetomoeda.model.Usuario;
import com.pucminas.backprojetomoeda.usecase.usuario.DeletarUsuarioUseCase;
import com.pucminas.backprojetomoeda.usecase.usuario.EditarUsuarioUseCase;
import com.pucminas.backprojetomoeda.usecase.usuario.ObterUsuarioUseCase;
import com.pucminas.backprojetomoeda.usecase.usuario.SalvarNovoUsuarioUseCase;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/usuario")
public class UsuarioController {
    @Autowired
    SalvarNovoUsuarioUseCase salvarNovoUsuarioUseCase;

    @Autowired
    DeletarUsuarioUseCase deletarUsuarioUseCase;

    @Autowired
    EditarUsuarioUseCase editarUsuarioUseCase;

    @Autowired
    ObterUsuarioUseCase obterUsuarioUseCase;

    @Autowired
    UsuarioService usuarioService;

    @PostMapping("/novoUsuario")
    public ResponseEntity<Usuario> salvaNovoUsuario(@RequestBody @Valid Usuario usuario) {
        return ResponseEntity.ok(salvarNovoUsuarioUseCase.salvarNovoUsuario(usuario));
    }

    @DeleteMapping("/deletarUsuario")
    public ResponseEntity<Usuario> deletarUsuario(@RequestBody String usuario) {
        return ResponseEntity.ok(deletarUsuarioUseCase.deletarUsuario(usuario));
    }

    @PostMapping("/editarUsuario")
    public ResponseEntity<Usuario> editarUsuario(@RequestBody Usuario params) {
        return ResponseEntity.ok(usuarioService.editarUsuario(params.getEmail(),params));
    }

    @GetMapping("/login")
    public ResponseEntity<Usuario> obterUsuario(@RequestParam String usuario, @RequestParam String senha) {
        return ResponseEntity.ok(obterUsuarioUseCase.obterUsuarioPorId(usuario, senha));
    }

    @GetMapping("/obterUsuariosPorTipoAcesso")
    public ResponseEntity<List<Usuario>> obterUsuarioPorAcesso(@RequestParam TipoUsuario usuario) {
        return ResponseEntity.ok(obterUsuarioUseCase.obterUsuarioPorTipoAcesso(usuario));
    }


}
