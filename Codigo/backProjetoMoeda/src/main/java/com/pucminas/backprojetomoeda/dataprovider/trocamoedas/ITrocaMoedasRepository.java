package com.pucminas.backprojetomoeda.dataprovider.trocamoedas;

import com.pucminas.backprojetomoeda.model.TrocaMoedas;
import com.pucminas.backprojetomoeda.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ITrocaMoedasRepository extends JpaRepository<TrocaMoedas, Long> {
    List<TrocaMoedas> findByConsumidor(Usuario consumidor);
}
