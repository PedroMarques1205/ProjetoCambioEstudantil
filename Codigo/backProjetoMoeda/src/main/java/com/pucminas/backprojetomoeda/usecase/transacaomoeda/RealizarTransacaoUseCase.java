package com.pucminas.backprojetomoeda.usecase.transacaomoeda;

import com.pucminas.backprojetomoeda.core.transacaomoeda.TransacaoMoedasService;
import com.pucminas.backprojetomoeda.entrypoint.transacaomoeda.dto.RequestTransacaoDTO;
import com.pucminas.backprojetomoeda.model.TransacaoMoedas;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class RealizarTransacaoUseCase {
    @Autowired
    TransacaoMoedasService transacaoMoedasService;

    public TransacaoMoedas realizarTransacao(RequestTransacaoDTO transacaoMoedas) {
        return transacaoMoedasService.salvarTransacao(transacaoMoedas);
    }
}
