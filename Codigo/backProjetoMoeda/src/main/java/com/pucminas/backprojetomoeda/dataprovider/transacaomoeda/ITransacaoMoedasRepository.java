package com.pucminas.backprojetomoeda.dataprovider.transacaomoeda;

import com.pucminas.backprojetomoeda.model.TransacaoMoedas;
import com.pucminas.backprojetomoeda.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ITransacaoMoedasRepository extends JpaRepository<TransacaoMoedas, Long> {
    List<TransacaoMoedas> findByAlunoDestinatarioOrProfessorRemetente(Usuario aluno,Usuario professor);
}
