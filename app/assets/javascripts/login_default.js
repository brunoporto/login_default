//= require login_default/jquery-1.12.2.min
//= require login_default/bootstrap.min
//= require login_default/sweetalert.min
//INCORPORADO O JS UNOBTRUSIVE POIS NÃO ENCONTROU DIRETAMENTE DA GEM
//= require login_default/unobtrusive_flash
//= require_self

flashHandler = function(e, params) {
    if (params!=undefined && params.message!=undefined && params.message!='') {
        swal({title: '', text: params.message, type: flashTypesToBootstrapTypes(params.type), html: true });
    }
};

function flashTypesToBootstrapTypes(type) {
    switch (type) {
        case 'alert': return 'warning'; break;
        case 'notice': return 'info'; break;
        default: return type;
    }
}

$(window).bind('rails:flash', flashHandler);
