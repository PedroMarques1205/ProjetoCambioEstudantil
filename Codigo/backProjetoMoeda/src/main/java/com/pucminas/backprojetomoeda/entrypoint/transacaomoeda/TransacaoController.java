package com.pucminas.backprojetomoeda.entrypoint.transacaomoeda;

import com.pucminas.backprojetomoeda.core.transacaomoeda.TransacaoMoedasService;
import com.pucminas.backprojetomoeda.entrypoint.transacaomoeda.dto.ExtratoDTO;
import com.pucminas.backprojetomoeda.entrypoint.transacaomoeda.dto.RequestTransacaoDTO;
import com.pucminas.backprojetomoeda.model.TransacaoMoedas;
import com.pucminas.backprojetomoeda.usecase.transacaomoeda.RealizarTransacaoUseCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/transacao")
public class TransacaoController {
    @Autowired
    RealizarTransacaoUseCase realizarTransacaoUseCase;

    @Autowired
    TransacaoMoedasService transacaoMoedasService;

    @PostMapping("/realizarTransacao")
    public ResponseEntity<TransacaoMoedas> realizarTransacao(@RequestBody RequestTransacaoDTO transacaoMoedas) {
        return ResponseEntity.ok(realizarTransacaoUseCase.realizarTransacao(transacaoMoedas));
    }

    @GetMapping("ObterExtratoUsuario")
    public ResponseEntity<ExtratoDTO> obterExtratoUsuario(@RequestParam String emailUsuario) {
        return ResponseEntity.ok(transacaoMoedasService.obterExtrato(emailUsuario));
    }

}
