package com.pucminas.backprojetomoeda.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.pucminas.backprojetomoeda.common.enums.TipoUsuario;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

@Data
@Entity(name = "Usuarios")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Usuario {
    @Id
    private String email;

    private String cpf;

    private String cnpj;

    private String rg;

    private String endereco;

    private String nome;

    private String senha;

    TipoUsuario tipoAcesso;

    boolean ativo = true;

    Double saldoMoedas;
}
