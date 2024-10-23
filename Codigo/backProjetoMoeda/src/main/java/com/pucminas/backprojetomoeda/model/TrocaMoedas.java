package com.pucminas.backprojetomoeda.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity(name = "TrocaMoedas")
public class TrocaMoedas {

    @Id
            @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long idTroca;

    @ManyToOne
    @JoinColumn(name = "consumidor_email")
    Usuario consumidor;

    Double valorMoedasGastas;

    @ManyToOne
    @JoinColumn(name = "vantagem_adquirida_id")
    Vantagem vantagemAdquirida;

}
