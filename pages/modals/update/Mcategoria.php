<div class="modal fade text-xs-left" id="editar_categoria" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
	<div class="modal-dialog" role="document">
    	<div class="modal-content">
    		<div class="modal-header">
    			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
        			<span aria-hidden="true">&times;</span>
        		</button>
        		<h4 class="modal-title" id="myModalLabel2"><i class="icon-road2"></i> Editar categoría</h4>
    		</div>
      		<div class="modal-body">
                <input type="hidden" id="codigo_cat_editar">
                <div class="form-group">
                    <label for="nombre_cat">Nombre de la categoría</label>
                    <div class="position-relative has-icon-left">
                        <input type="text" class="form-control" id="nombre_cat_editar" placeholder="Ingrese el nombre de la categoría" autofocus>
                        <div class="form-control-position"><i class="icon-bag"></i></div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="descripcion_cat">Descripción breve</label>
                    <div class="position-relative has-icon-left">
                        <textarea rows="7" type="text" class="form-control" id="descripcion_cat_editar" placeholder="Ingrese una breve descripción"></textarea>
                        <div class="form-control-position"><i class="icon-file2"></i></div>
                    </div>
                </div>
    		</div>
    		<div class="modal-footer">
        		<button type="button" class="btn grey btn-outline-secondary" data-dismiss="modal">Cancelar</button>
        		<button type="button" class="btn btn-outline-primary" onclick="EditarCategoria();">Guardar cambios</button>
    		</div>
    	</div>
	</div>
</div>