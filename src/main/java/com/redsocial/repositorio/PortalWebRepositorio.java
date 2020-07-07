package com.redsocial.repositorio;

import java.util.List;

import com.redsocial.entidad.PortalWeb;

public interface PortalWebRepositorio  {
	
	public PortalWeb insertaActualizaPortalWeb(PortalWeb obj);
	public void eliminaPortalWeb(int idPortal);
	public List<PortalWeb> listaPortalWeb();
	public List<PortalWeb> listaPortalWebPorNombre(String nom);
	
}
