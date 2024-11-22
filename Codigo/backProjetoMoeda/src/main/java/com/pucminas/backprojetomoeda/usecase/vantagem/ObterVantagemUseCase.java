package com.pucminas.backprojetomoeda.usecase.vantagem;

import com.pucminas.backprojetomoeda.core.vantagem.VantagemService;
import com.pucminas.backprojetomoeda.model.Usuario;
import com.pucminas.backprojetomoeda.model.Vantagem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ObterVantagemUseCase {
    @Autowired
    VantagemService vantagemService;

    public List<Vantagem> obterVantagem() {
        return vantagemService.buscarTodasVantagens();
    }

    public List<Vantagem> obterVantagemPorEmpresa(String empresa) {
        return vantagemService.buscarVantagensPorEmpresa(empresa);
    }

}
