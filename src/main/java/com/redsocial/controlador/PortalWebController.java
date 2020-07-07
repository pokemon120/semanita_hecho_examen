package com.redsocial.controlador;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.redsocial.entidad.Categoria;
import com.redsocial.entidad.PortalWeb;
import com.redsocial.servicio.CategoriaServicio;
import com.redsocial.servicio.PortalWebServicio;

@Controller
public class PortalWebController {

	@Autowired
	private PortalWebServicio portalWebServicio;
	
	@Autowired
	private CategoriaServicio categoriaServicio;

	@RequestMapping("/verPortalWeb")
	public String ver() {
		return "registraPortalWeb";
	}
	
	@RequestMapping("/cargaCategoria")
	@ResponseBody
	public List<Categoria> listaCategoria() {
		return categoriaServicio.listaCategoria();
	}
	
	@RequestMapping("/registraPortalWeb")
	public String metRegistra(PortalWeb obj,HttpSession session) {
		PortalWeb aux = portalWebServicio.insertaActualizaPortalWeb(obj);
		if(aux == null) {
			session.setAttribute("MENSAJE", "Registro erróneo");
		}else {
			session.setAttribute("MENSAJE", "Registro exitos");
		}
		return "redirect:verPortalWeb";
	}
}
