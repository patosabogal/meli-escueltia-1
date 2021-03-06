package projectmeli

import grails.transaction.Transactional
import projectmeli.Publicacion

@Transactional
class PublicacionService {

    List<Publicacion> getPublicacionesByKeyWord(String palabra, boolean nuevo, boolean usado){
		return Publicacion.withCriteria{
			like("titulo", "%"+palabra+"%")
			if(nuevo && !usado){
				eq("nuevo", true)
			}else if (!nuevo && usado) {
				eq("nuevo", false)
			}
	
		}
	}
	
	void savePublication(Publicacion publicacion){
	//	println "estoy pasando por guardar la publicacion \n";
		publicacion.save();
	}
	
	Publicacion finishSell(String titulo, Usuario autor){
		
		Publicacion p = Publicacion.findByTituloAndAutor(titulo,autor);
		
		p.cantidad --;
		p.save();
		return p;
		
	}
	
	Publicacion getPublicacion(String titulo, Usuario autor){
		
		Publicacion p = Publicacion.findByTituloAndAutor(titulo,autor);
		return p;
	}

}
