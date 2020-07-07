package com.redsocial.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.redsocial.entidad.Categoria;
import com.redsocial.entidad.PortalWeb;

@Repository
public class PortalWebrMySqlRepositorio implements PortalWebRepositorio{

	@Autowired
    private JdbcTemplate jdbcTemplate ;
	
	RowMapper<PortalWeb> mapperPortal = new RowMapper<PortalWeb>() {
		@Override
		public PortalWeb mapRow(ResultSet rs, int rowNum) throws SQLException {
			PortalWeb obj = new PortalWeb();
			obj.setIdPortal(rs.getInt(1));
			obj.setNombre(rs.getString(2));
			obj.setRuta(rs.getString(3));
			obj.setPais(rs.getString(4));
			obj.setFechaLanzamiento(rs.getString(5));
			obj.setInscriptores(rs.getInt(6));
			obj.setIdioma(rs.getString(7));
			
			Categoria objCategor = new Categoria();
			objCategor.setIdCategoria(rs.getInt(8));
			objCategor.setNombre(rs.getString(9));
		
			obj.setCategoria(objCategor);
			
			return obj;
		}
	};
	
	@Override
	public PortalWeb insertaActualizaPortalWeb(PortalWeb obj) {
		PortalWeb salida = null;
		if (obj.getIdPortal() == 0) {
			jdbcTemplate.update("insert into portalWeb values(null,?,?,?,?,?,?,?)",
			new Object[] {obj.getNombre(), obj.getRuta(), obj.getPais(), obj.getFechaLanzamiento(), obj.getInscriptores(), obj.getIdioma(),obj.getCategoria().getIdCategoria()});	
			List<PortalWeb> lista = jdbcTemplate.query("select m.*,d.nombre from portalWeb m inner join categoria d on m.idCategoria = d.idCategoria order by m.idPortal desc limit 0, 1",new Object[] {} ,mapperPortal);
			salida = lista.get(0);
		}else {
			jdbcTemplate.update("update portalWeb set nombre=?,ruta=?,pais=?,fechaLanzamiento=?,inscriptores =?,idioma =?, idCategoria = ? where idPortal=?", new Object[] {obj.getNombre(), obj.getRuta(), obj.getPais(), obj.getFechaLanzamiento(), obj.getInscriptores(), obj.getIdioma(), obj.getCategoria().getIdCategoria(), obj.getIdPortal()});
			List<PortalWeb> lista = jdbcTemplate.query("select m.*,d.nombre from portalWeb m inner join categoria d on m.idCategoria = d.idCategoria where m.idPortal =?",new Object[] {obj.getIdPortal()} ,mapperPortal);
			salida = lista.get(0);
		}
		return salida;
	}

	@Override
	public void eliminaPortalWeb(int idPortal) {
		jdbcTemplate.update("delete from portalWeb where idPortal = ?",new Object[] {idPortal});		
	}

	@Override
	public List<PortalWeb> listaPortalWeb() {
		List<PortalWeb> lista = jdbcTemplate.query("select m.*,d.nombre from portalWeb m inner join categoria d on m.idCategoria = d.idCategoria", new Object[] {} ,mapperPortal);
		return lista;
	}

	@Override
	public List<PortalWeb> listaPortalWebPorNombre(String nom) {
		List<PortalWeb> lista = jdbcTemplate.query("select m.*,d.nombre from portalWeb m inner join categoria d on m.idCategoria = d.idCategoria where m.nombre like ?", new Object[] {nom} ,mapperPortal);
		return lista;
	}

	
}
