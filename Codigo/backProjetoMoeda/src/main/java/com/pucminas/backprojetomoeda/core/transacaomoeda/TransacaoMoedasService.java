package com.pucminas.backprojetomoeda.core.transacaomoeda;

import com.pucminas.backprojetomoeda.dataprovider.transacaomoeda.ITransacaoMoedasRepository;
import com.pucminas.backprojetomoeda.dataprovider.usuario.IUsuarioRepository;
import com.pucminas.backprojetomoeda.entrypoint.transacaomoeda.dto.RequestTransacaoDTO;
import com.pucminas.backprojetomoeda.model.TransacaoMoedas;
import com.pucminas.backprojetomoeda.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class TransacaoMoedasService {
    @Autowired
    ITransacaoMoedasRepository transacaoMoedasRepository;

    @Autowired
    IUsuarioRepository usuarioRepository;

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
}
