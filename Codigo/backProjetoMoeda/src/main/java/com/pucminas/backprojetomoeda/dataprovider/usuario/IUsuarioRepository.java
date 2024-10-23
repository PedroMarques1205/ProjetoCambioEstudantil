package com.pucminas.backprojetomoeda.dataprovider.usuario;

import com.pucminas.backprojetomoeda.common.enums.TipoUsuario;
import com.pucminas.backprojetomoeda.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IUsuarioRepository extends JpaRepository<Usuario, String> {
    List<Usuario> findByTipoAcesso(TipoUsuario tipoUsuario);


}
