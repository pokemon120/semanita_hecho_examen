package com.redsocial.controlador;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.redsocial.entidad.PortalWeb;
import com.redsocial.servicio.PortalWebServicio;

@Controller
public class PortalWebrCrudController {

	@Autowired
	private PortalWebServicio servicio;
	
	@RequestMapping("/verCrudPortalWeb")
	public String ver() {
		return "crudPortalWeb";
	}
	
	@RequestMapping("/consultaCrudPortalWeb")
	public String lista(String filtro, Model m) {
		List<PortalWeb> lista =  servicio.listaPortalWebPorNombre(filtro+"%");
		m.addAttribute("portales", lista);
		return "crudPortalWeb";
	}
	
	@RequestMapping("/registraActualizaCrudPortalWeb")
	public String registraActualiza(PortalWeb obj, Model m) {
		servicio.insertaActualizaPortalWeb(obj);
		List<PortalWeb> lista =  servicio.listaPortalWeb();
		m.addAttribute("portales", lista);
		return "crudPortalWeb";
	}
	
	@RequestMapping("/eliminaCrudPortalWeb")
	public String elimina(int id, Model m) {
		servicio.eliminaPortalWeb(id);
		List<PortalWeb> lista =  servicio.listaPortalWeb();
		m.addAttribute("portales", lista);
		return "crudPortalWeb";
	}
}
