package com.pucminas.backprojetomoeda.core.trocamoedas;

import com.pucminas.backprojetomoeda.core.usuario.UsuarioService;
import com.pucminas.backprojetomoeda.core.vantagem.VantagemService;
import com.pucminas.backprojetomoeda.dataprovider.trocamoedas.ITrocaMoedasRepository;
import com.pucminas.backprojetomoeda.model.TrocaMoedas;
import com.pucminas.backprojetomoeda.model.Usuario;
import com.pucminas.backprojetomoeda.model.Vantagem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class TrocaMoedasService {

    @Autowired
    ITrocaMoedasRepository trocaMoedasRepository;

    @Autowired
    VantagemService vantagemService;

    @Autowired
    UsuarioService usuarioService;

    public TrocaMoedas realizarTroca(Usuario consumidor, Long idVantagem) {
        Vantagem vantagem = vantagemService.buscarVantagemPorId(idVantagem);
        if (vantagem == null || consumidor.getSaldoMoedas() < vantagem.getValor()) {
            return null;
        }

        consumidor.setSaldoMoedas(consumidor.getSaldoMoedas() - vantagem.getValor());
        usuarioService.salvarUsuario(consumidor);

        TrocaMoedas trocaMoedas = new TrocaMoedas();
        trocaMoedas.setConsumidor(consumidor);
        trocaMoedas.setValorMoedasGastas(vantagem.getValor());
        trocaMoedas.setVantagemAdquirida(vantagem);
        trocaMoedas.setDataTroca(new Date());

        return trocaMoedasRepository.save(trocaMoedas);
    }

    public List<TrocaMoedas> buscarTrocasPorUsuario(Usuario consumidor) {
        return trocaMoedasRepository.findByConsumidor(consumidor);
    }
}
