// sub quantity
$(document).on("click", "#sub", function (e) {
    if ($(this).next().val() - 1 > 0) {
        // minus quantity
        $(this).next().val(+$(this).next().val() - 1);
        // get current quantity
        var quantity = $(this).next().val();
        // url
        var url = $('#url').val();
        // product_id
        var product_id = $('#product_id').val();
        // price
        var price = $('#price').val();
        // purchase_id
        var purchase_id = $('#purchase_id').val();
        // color name of product want to update
        var product_color = $(this)[0].value;
        // total all
        var total = $('#total').val();
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            type: "POST",
            url: url,
            datatype: "JSON",
            async: false,
            data: {
                name: "sub",
                purchase_id: purchase_id,
                product_id: product_id,
                product_color: product_color,
                quantity: quantity,
                price: price
            },
            success: function (msg) {
                var msg = JSON.parse(msg);
                console.log(msg[0]);
                document.getElementById("totalSum").textContent = msg[0] + "đ";
                document.getElementById("totalSum").value = msg[0];
            }
        });
    }
});

// add quantity
$(document).on("click", "#add", function (e) {

    // add quantity
    $(this).prev().val(+$(this).prev().val() + 1);
    // get current quantity
    var quantity = $(this).prev().val();
    // url
    var url = $('#url').val();
    // product_id
    var product_id = $('#product_id').val();
    // price
    var price = $('#price').val();
    // purchase_id
    var purchase_id = $('#purchase_id').val();
    // color name of product want to update
    var product_color = $(this)[0].value;
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        type: "POST",
        url: url,
        datatype: "JSON",
        async: false,
        data: {
            name: "add",
            purchase_id: purchase_id,
            product_id: product_id,
            product_color: product_color,
            quantity: quantity,
            price: price
        },
        success: function (msg) {
            var msg = JSON.parse(msg);
            console.log(msg[0]);
            document.getElementById("totalSum").textContent = msg[0] + "đ";
            document.getElementById("totalSum").value = msg[0];
        }
    });
    console.log("hello")
});

//delete product
$(document).on("click", "#del", function (e) {
    if (confirm("Are you sure delete this ?")) {
        // url
        var url = $('#url').val();
        // product_id
        var product_id = $('#product_id').val();
        // purchase_id
        var purchase_id = $('#purchase_id').val();
        // quantity
        var quantity = $('#counter').val();
        // price
        var price = $('#price').val();
        // color name of product want to update
        var product_color = $(this)[0].value;

        var id_holder = "deleteItem_" + product_color;
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            type: "POST",
            url: url,
            datatype: "JSON",
            async: false,
            data: {
                name: "del",
                purchase_id: purchase_id,
                product_id: product_id,
                product_color: product_color,
                quantity: quantity,
                price: price
            },
            success: function (msg) {
                var msg = JSON.parse(msg);
                if (msg[0] == "empty") {
                    $('#order_sumary')[0].innerHTML = "<h1>Your Cart is Empty</h1><a href='/'>Trang chủ</a>";
                }
                document.getElementById("totalSum").textContent = msg[0] + "đ";
                document.getElementById("totalSum").value = msg[0];
                $('.row').each(function () {
                    if ($(this)[0].id === id_holder) {
                        $(this)[0].innerHTML = "";
                        return false;
                    }
                });

            }
        });
    }
});


function validateForm() {
    var purchase_id = document.getElementById('purchase_id').value;
    var name = document.getElementById('form3Example1').value;
    var phone = document.getElementById('form3Example2').value;
    var adress = document.getElementById('form3Example3').value;
    var payment = $('input[name="payment"]:checked').val();

    if (name == "" || phone == "" || adress == "") {
        alert("Mày chưa điền đủ thông tin kìa");
        return false;
    }


    document.getElementById('pur_id').value = purchase_id;
    document.getElementById('name').value = name;
    document.getElementById('phone').value = phone;
    document.getElementById('adress').value = adress;
    document.getElementById('pay').value = payment;
}

$(document).ready(function () {
    $('#form3Example5').blur(function (e) {
        if (!validatePhone('form3Example5')) {
            $('#spnPhoneStatus').html('Invalid');
            $('#spnPhoneStatus').css('color', 'red');
        }
        else {
            $('#spnPhoneStatus').html('');
        }
    });
});


function validatePhone(txtPhone) {
    var a = document.getElementById(txtPhone).value;
    var filter = /^((\+[1-9]{1,4}[ \-]*)|(\([0-9]{2,3}\)[ \-]*)|([0-9]{2,4})[ \-]*)*?[0-9]{3,4}?[ \-]*[0-9]{3,4}?$/;
    if (filter.test(a)) {
        return true;
    }
    else {
        return false;
    }
}



function validateInformationCustomer() {
    var name = document.getElementById('form3Example11').value;
    var phone = document.getElementById('form3Example5').value;
    var adress = document.getElementById('form3Example4').value;

    if (name == "" || phone == "" || adress == "") {
        alert("Mày chưa điền đủ thông tin kìa");
        return false;
    }

    document.getElementById('form3Example1').value = name;
    document.getElementById('form3Example2').value = phone;
    document.getElementById('form3Example3').value = adress;



}