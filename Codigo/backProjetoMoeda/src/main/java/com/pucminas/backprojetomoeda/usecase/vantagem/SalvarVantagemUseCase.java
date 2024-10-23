package com.pucminas.backprojetomoeda.usecase.vantagem;

import com.pucminas.backprojetomoeda.core.vantagem.VantagemService;
import com.pucminas.backprojetomoeda.model.Vantagem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SalvarVantagemUseCase {

    @Autowired
    VantagemService vantagemService;

    public Vantagem salvarVantagem(Vantagem vantagem) {
        return vantagemService.saveVantagem(vantagem);
    }
}
