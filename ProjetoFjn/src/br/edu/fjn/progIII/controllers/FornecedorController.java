/**
 * @author Fransuelio Nobre
 * 
 * Controller para Fornecedores
 */

package br.edu.fjn.progIII.controllers;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.edu.fjn.progIII.dao.FornecedorDAO;
import br.edu.fjn.progIII.model.Estado.Estado;
import br.edu.fjn.progIII.model.fornecedor.Fornecedor;

@Controller
@Path("fornecedor")
public class FornecedorController {

	@Inject
	private Result result;

	@Get("novo")
	public void form() {
		EstadoController estadoController = new EstadoController();
		List<Estado> estados = estadoController.json();
		result.include("estados", estados);
	}

	@Post("salvar")
	public void salvar(Fornecedor fornecedor) {
		FornecedorDAO fornecedorDAO = new FornecedorDAO();
		fornecedorDAO.salvarFornecedor(fornecedor);
		result.include("message", "Fornecedor " + fornecedor.getNome() + " cadastrado com sucesso!");
		result.redirectTo(this).form();
	}

}
