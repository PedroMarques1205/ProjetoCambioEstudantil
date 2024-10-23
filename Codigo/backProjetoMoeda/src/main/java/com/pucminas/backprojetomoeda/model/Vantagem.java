package com.pucminas.backprojetomoeda.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity(name = "Vantagens")
public class Vantagem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    String titulo;

    String descricao;

    Double valor;

    @ManyToOne
    @JoinColumn(name = "empresa_provedor_email")
    Usuario empresaProvedor;
}
