package com.pucminas.backprojetomoeda.entrypoint.transacaomoeda.dto;

import com.pucminas.backprojetomoeda.model.Usuario;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RequestTransacaoDTO {
    Usuario professor;
    Usuario aluno;
    Double valorMoedas;
}
