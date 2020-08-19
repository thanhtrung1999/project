<!doctype html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv='Content-Type' content='text/htmlcharset=UTF-8'>
    <meta http-equiv='Content-Type' content='text/plaincharset=UTF-8'>
    <link href="https://fonts.googleapis.com/css2?family=Charm:wght@400;700&display=swap" rel="stylesheet">
    <style>
        *{
            box-sizing: border-box;
        }
        .send-mail__block{
            width: 60%;
            margin: 1rem auto;
            -webkit-box-shadow: 4px 1px 20px 5px rgba(0,0,0,0.2);
            box-shadow: 4px 1px 20px 5px rgba(0,0,0,0.2);
        }
        #g10-logo{
            width: 100%;
            text-align: center;
            font-size: 2.5rem;
            font-family: "Charm", cursive;
            text-transform: uppercase;
            background-color: #097651;
            color: #f1f1f1;
            font-weight: bold;
            margin: auto;
            padding: .625rem;
        }
        .send-mail__block__content{
            width: 100%;
            padding: 1.5rem;
            border: 2px solid #097651;
        }
        .send-mail__block__content > h1 {
            margin: 0;
        }
    </style>
</head>
<body>
<div class="send-mail__block">
    <h1 id="g10-logo">G10 Shop</h1>
    <div class="send-mail__block__content">
        <h1>Cảm ơn bạn đã đặt hàng</h1>
        <p>Xin chào <b><?=$full_name?></b>,</p>
        <p>Đơn hàng #<?=$order_id?> đã được đặt thành công và chúng tôi đang xử lý</p>
        <h2>Chi tiết <span>[Đơn hàng #<?=$order_id?>]</span> (<?=$date?>)</h2>
        <table cellpadding='5'>
            <tr>
                <th>Tên sản phẩm</th>
                <th>Màu</th>
                <th>Số lượng</th>
                <th>Giá</th>
            </tr>
            <?php foreach ($order_detail AS $product_id => $cart):?>
                <?php if(empty($product_variants)):?>
                    <tr>
                        <td><?= $cart['name']?></td>
                        <td></td>
                        <td><?= $cart['amount']?></td>
                        <td><?= number_format($cart['price'])?>đ</td>
                    </tr>
                <?php else:?>
                    <?php foreach ($cart as $variant_value_id => $item):
                        $color = '';
                        if (!empty($product_variants)) {
                            foreach ($product_variants as $product_variant) {
                                if ($product_variant['variant_value_id'] == $variant_value_id) {
                                    $color = $product_variant['variant_value'];
                                }
                            }
                        }
                        ?>
                        <tr>
                            <td><?= $item['name']?></td>
                            <td><?= strtoupper($color)?></td>
                            <td><?= $item['amount']?></td>
                            <td><?= number_format($item['price'])?>đ</td>
                        </tr>
                    <?php endforeach;?>
                <?php endif;?>
            <?php endforeach;?>
            <tr>
                <td colspan='3'><b>Tổng đơn hàng:</b></td>
                <td><?= number_format($price_total)?>đ</td>
            </tr>
        </table>
        <div>
            <p>Địa chỉ giao hàng: <span><?= $address?></span></p>
            <p>Số điện thoại liên hệ: <span><?= $mobile?></span></p>
            <p>Ghi chú: <span><?= $note?></span></p>
        </div>
    </div>
</div>
</body>
</html>