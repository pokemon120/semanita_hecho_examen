package com.redsocial.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.redsocial.entidad.PortalWeb;
import com.redsocial.repositorio.PortalWebRepositorio;

@Service
public class PortalWebServicioImpl implements PortalWebServicio{

	@Autowired
	private PortalWebRepositorio repositorio;

	@Override
	public PortalWeb insertaActualizaPortalWeb(PortalWeb obj) {
		return repositorio.insertaActualizaPortalWeb(obj);
	}

	@Override
	public void eliminaPortalWeb(int idPortal) {
		repositorio.eliminaPortalWeb(idPortal);
	}

	@Override
	public List<PortalWeb> listaPortalWeb() {
		return repositorio.listaPortalWeb();
	}

	@Override
	public List<PortalWeb> listaPortalWebPorNombre(String nom) {
		return repositorio.listaPortalWebPorNombre(nom);
	}
	


}


