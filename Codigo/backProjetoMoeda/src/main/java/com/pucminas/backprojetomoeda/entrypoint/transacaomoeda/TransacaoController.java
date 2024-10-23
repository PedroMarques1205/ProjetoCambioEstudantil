package com.pucminas.backprojetomoeda.entrypoint.transacaomoeda;

import com.pucminas.backprojetomoeda.entrypoint.transacaomoeda.dto.RequestTransacaoDTO;
import com.pucminas.backprojetomoeda.model.TransacaoMoedas;
import com.pucminas.backprojetomoeda.usecase.transacaomoeda.RealizarTransacaoUseCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/transacao")
public class TransacaoController {
    @Autowired
    RealizarTransacaoUseCase realizarTransacaoUseCase;

    @PostMapping("/realizarTransacao")
    public ResponseEntity<TransacaoMoedas> realizarTransacao(@RequestBody RequestTransacaoDTO transacaoMoedas) {
        return ResponseEntity.ok(realizarTransacaoUseCase.realizarTransacao(transacaoMoedas));
    }

}
