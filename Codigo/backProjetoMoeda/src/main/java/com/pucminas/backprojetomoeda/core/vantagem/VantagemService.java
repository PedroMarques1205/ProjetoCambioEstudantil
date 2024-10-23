package com.pucminas.backprojetomoeda.core.vantagem;

import com.pucminas.backprojetomoeda.dataprovider.vantagem.IVantagemRepository;
import com.pucminas.backprojetomoeda.model.Vantagem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VantagemService {

    @Autowired
    IVantagemRepository vantagemRepository;

    public Vantagem saveVantagem(Vantagem vantagem) {
        return vantagemRepository.save(vantagem);
    }

    public List<Vantagem> findAllVantagem() {
        return vantagemRepository.findAll();
    }
}
