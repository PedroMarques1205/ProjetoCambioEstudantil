package com.pucminas.backprojetomoeda.entrypoint.transacaomoeda.dto;

import com.pucminas.backprojetomoeda.model.TransacaoMoedas;
import com.pucminas.backprojetomoeda.model.TrocaMoedas;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ExtratoDTO {
    Double saldoAtual;
    List<TransacaoMoedas> transacoes;
    List<TrocaMoedas> trocas;
}
