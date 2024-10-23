package com.pucminas.backprojetomoeda.core.transacaomoeda;

import com.pucminas.backprojetomoeda.dataprovider.transacaomoeda.ITransacaoMoedasRepository;
import com.pucminas.backprojetomoeda.dataprovider.trocamoedas.ITrocaMoedasRepository;
import com.pucminas.backprojetomoeda.dataprovider.usuario.IUsuarioRepository;
import com.pucminas.backprojetomoeda.entrypoint.transacaomoeda.dto.ExtratoDTO;
import com.pucminas.backprojetomoeda.entrypoint.transacaomoeda.dto.RequestTransacaoDTO;
import com.pucminas.backprojetomoeda.model.TransacaoMoedas;
import com.pucminas.backprojetomoeda.model.TrocaMoedas;
import com.pucminas.backprojetomoeda.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class TransacaoMoedasService {
    @Autowired
    ITransacaoMoedasRepository transacaoMoedasRepository;

    @Autowired
    IUsuarioRepository usuarioRepository;

    @Autowired
    ITrocaMoedasRepository trocaMoedasRepository;


    public TransacaoMoedas salvarTransacao(RequestTransacaoDTO requestTransacaoDTO) {
        TransacaoMoedas transacaoMoedas = new TransacaoMoedas();

        transacaoMoedas.setDataTransacao(new Date());
        transacaoMoedas.setNumMoedasTransferidas(requestTransacaoDTO.getValorMoedas());
        transacaoMoedas.setProfessorRemetente(requestTransacaoDTO.getProfessor());
        transacaoMoedas.setAlunoDestinatario(requestTransacaoDTO.getAluno());
        Usuario professor = requestTransacaoDTO.getProfessor();
        Usuario aluno = requestTransacaoDTO.getAluno();

        Double novoSaldoProfessor = professor.getSaldoMoedas() - requestTransacaoDTO.getValorMoedas();
        Double novoSaldoAluno = aluno.getSaldoMoedas() + requestTransacaoDTO.getValorMoedas();

        professor.setSaldoMoedas(novoSaldoProfessor);
        usuarioRepository.save(professor);

        aluno.setSaldoMoedas(novoSaldoAluno);
        usuarioRepository.save(aluno);

        return transacaoMoedasRepository.save(transacaoMoedas);
    }

    public ExtratoDTO obterExtrato(String emailUsuario) {
        Usuario usuario = usuarioRepository.findById(emailUsuario).orElse(null);

        if (usuario == null) {
            return null;
        }

        List<TransacaoMoedas> transacoes = transacaoMoedasRepository.findByAlunoDestinatarioOrProfessorRemetente(usuario, usuario);
        List<TrocaMoedas> trocas = trocaMoedasRepository.findByConsumidor(usuario);

        return ExtratoDTO.builder()
                .saldoAtual(usuario.getSaldoMoedas())
                .transacoes(transacoes)
                .trocas(trocas)
                .build();
    }
}
