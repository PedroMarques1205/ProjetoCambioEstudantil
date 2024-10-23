package com.pucminas.backprojetomoeda.model;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

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

    Date dataTroca;

    @ManyToOne
    @JoinColumn(name = "vantagem_adquirida_id")
    Vantagem vantagemAdquirida;

}
