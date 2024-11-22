package com.pucminas.backprojetomoeda.core.vantagem;

import com.pucminas.backprojetomoeda.dataprovider.vantagem.IVantagemRepository;
import com.pucminas.backprojetomoeda.model.Usuario;
import com.pucminas.backprojetomoeda.model.Vantagem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VantagemService {

    @Autowired
    IVantagemRepository vantagemRepository;

    public Vantagem salvarVantagem(Vantagem vantagem) {
        return vantagemRepository.save(vantagem);
    }

    public Vantagem buscarVantagemPorId(Long id) {
        return vantagemRepository.findById(id).orElse(null);
    }

    public List<Vantagem> buscarVantagensPorEmpresa(String empresa) {
        return vantagemRepository.findByEmpresaProvedor_Cnpj(empresa);
    }

    public List<Vantagem> buscarTodasVantagens() {
        return vantagemRepository.findAll();
    }

    public void deletarVantagem(Long id) {
        if (vantagemRepository.findById(id).isPresent()) {
            vantagemRepository.deleteById(id);
        }
    }
}
