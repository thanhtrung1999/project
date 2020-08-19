$(document).ready(function () {
    CKEDITOR.replace('description' , {
        //đường dẫn đến file ckfinder.html của ckfinder
        filebrowserBrowseUrl: 'assets/ckfinder/ckfinder.html',
        //đường dẫn đến file connector.php của ckfinder
        filebrowserUploadUrl: 'assets/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files'
    });
    let i = 0;
    $('.variants .btn-insert-variant').click(function () {
        i++;
        $('.variants').append('' +
            '<div class="form-group variant-section">' +
            '<i class="fas fa-times" onclick="removeVariant(this)"></i>' +
            '<label for="variant-name--'+i+'">Tên biến thể</label>' +
            '<input type="text" name="variant_name[]" id="variant-name--'+i+'" class="form-control" value="">' +
            '<label for="variant-value--'+i+'">Giá trị biến thể</label>' +
            '<textarea placeholder="Vui lòng nhập các giá trị cách nhau bởi dấu phẩy và khoảng trắng (, )(VD: đen, trắng)"' +
            'name="variant_value[]" id="variant-value--'+i+'" ' +
            'class="form-control"></textarea>' +
            '</div>'
        );
    });

    $('.brands-form .btn-create-brand').click(function () {
        $('.brands-form .brand-list-table tbody').append(
            '<tr>' +
            '<td><b>Nhập tên hãng</b></td>' +
            '<td><input class="form-control" type="text" name="brand_name[]" value=""></td>' +
            '<td><i class="fas fa-times btn" onclick="removeBrand(this)" style="cursor: pointer"></i></td>' +
            '</tr>'
        );
    });

    // $('.variant-section i.fa-times').click(function () {
    //     alert("...");
    // });
});

function removeVariant(btn) {
    $(btn).parent().remove();
}

function removeBrand(btn) {
    $(btn).parent().parent().remove();
}
