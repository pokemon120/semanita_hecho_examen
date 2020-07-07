package com.redsocial.servicio;

import java.util.List;

import com.redsocial.entidad.PortalWeb;

public interface PortalWebServicio {

	public PortalWeb insertaActualizaPortalWeb(PortalWeb obj);
	public void eliminaPortalWeb(int idJPortal);
	public List<PortalWeb> listaPortalWeb();
	public List<PortalWeb> listaPortalWebPorNombre(String nom);

}
