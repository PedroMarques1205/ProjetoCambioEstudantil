package com.pucminas.backprojetomoeda.entrypoint.trocamoeda;

import com.pucminas.backprojetomoeda.core.trocamoedas.TrocaMoedasService;
import com.pucminas.backprojetomoeda.core.usuario.UsuarioService;
import com.pucminas.backprojetomoeda.model.TrocaMoedas;
import com.pucminas.backprojetomoeda.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/troca")
public class TrocaMoedaController {
    @Autowired
    TrocaMoedasService trocaMoedasService;

    @Autowired
    UsuarioService usuarioService;

    @PostMapping("/realizar")
    public ResponseEntity<TrocaMoedas> realizarTroca(@RequestParam String emailUsuario, @RequestParam Long idVantagem) {
        Usuario consumidor = usuarioService.buscarUsuarioPorEmail(emailUsuario);

        if (consumidor == null) {
            return ResponseEntity.badRequest().body(null);
        }

        TrocaMoedas trocaMoedas = trocaMoedasService.realizarTroca(consumidor, idVantagem);

        if (trocaMoedas != null) {
            return ResponseEntity.ok(trocaMoedas);
        }

        return ResponseEntity.badRequest().build();
    }

}
