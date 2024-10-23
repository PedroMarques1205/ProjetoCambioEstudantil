package com.pucminas.backprojetomoeda.model;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Data
@Entity(name = "Transacoes")
public class TransacaoMoedas {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long idTransacao;

    @ManyToOne
    @JoinColumn(name = "aluno_destinatario_cpf")
    Usuario alunoDestinatario;

    @ManyToOne
    @JoinColumn(name = "professor_remetente_cpf")
    Usuario professorRemetente;

    Double numMoedasTransferidas;

    Date dataTransacao;

    String intituicao;
}
