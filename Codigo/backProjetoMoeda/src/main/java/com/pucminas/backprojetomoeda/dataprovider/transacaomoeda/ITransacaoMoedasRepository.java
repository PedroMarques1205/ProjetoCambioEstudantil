package com.pucminas.backprojetomoeda.dataprovider.transacaomoeda;

import com.pucminas.backprojetomoeda.model.TransacaoMoedas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ITransacaoMoedasRepository extends JpaRepository<TransacaoMoedas, Long> {
}
