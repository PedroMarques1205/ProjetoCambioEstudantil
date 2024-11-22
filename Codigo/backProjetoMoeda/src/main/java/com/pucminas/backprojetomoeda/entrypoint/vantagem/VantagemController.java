package com.pucminas.backprojetomoeda.entrypoint.vantagem;


import com.pucminas.backprojetomoeda.model.Usuario;
import com.pucminas.backprojetomoeda.model.Vantagem;
import com.pucminas.backprojetomoeda.usecase.usuario.ObterUsuarioUseCase;
import com.pucminas.backprojetomoeda.usecase.vantagem.ObterVantagemUseCase;
import com.pucminas.backprojetomoeda.usecase.vantagem.SalvarVantagemUseCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/vantagem")
public class VantagemController {
    @Autowired
    ObterVantagemUseCase obterVantagemUseCase;

    @Autowired
    SalvarVantagemUseCase salvarVantagemUseCase;

    @PostMapping("/salvar")
    public ResponseEntity<Vantagem> salvar(@RequestBody Vantagem vantagem) {
        return ResponseEntity.ok(salvarVantagemUseCase.salvarVantagem(vantagem));
    }

    @GetMapping("/obterTodasVantagens")
    public ResponseEntity<List<Vantagem>> obterTodasVantagens() {
        return ResponseEntity.ok(obterVantagemUseCase.obterVantagem());
    }

    @GetMapping("/obterVantagensPorEmpresa")
    public ResponseEntity<List<Vantagem>> obterTodasVantagens(@RequestParam String cnpj) {
        return ResponseEntity.ok(obterVantagemUseCase.obterVantagemPorEmpresa(cnpj));
    }

}
