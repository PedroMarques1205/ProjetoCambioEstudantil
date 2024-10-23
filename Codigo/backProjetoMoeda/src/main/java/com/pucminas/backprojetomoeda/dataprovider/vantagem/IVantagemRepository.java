package com.pucminas.backprojetomoeda.dataprovider.vantagem;

import com.pucminas.backprojetomoeda.model.Vantagem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IVantagemRepository extends JpaRepository<Vantagem, Long> {

}
