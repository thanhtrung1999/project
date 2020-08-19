<?php
require_once 'controllers/Controller.php';
require_once 'models/Category.php';
require_once 'models/Product.php';
require_once 'models/Order.php';
require_once 'models/OrderDetail.php';
require_once 'configs/PHPMailer/src/PHPMailer.php';
require_once 'configs/PHPMailer/src/SMTP.php';
require_once 'configs/PHPMailer/src/Exception.php';

class CheckoutController extends Controller {
    public function index(){
        $category_model = new Category();
        $categories = $category_model->getAllCategories();

        if (!isset($_SESSION['cart'])) {
            $_SESSION['error'] = 'Không thể thanh toán khi giỏ hàng ko có sản phẩm';
//            $url_redirect = $_SERVER['SCRIPT_NAME'] . '/cart';
            header("Location: index.php?controller=cart&action=index");
            exit();
        }

        $product_variants = [];
        $product_model = new Product();

        foreach ($_SESSION['cart'] as $product_id => $product){
            $product_variants[$product_id] = $product_model->getProductVariantsById($product_id);
        }

        if(isset($_POST['order'])){
            $full_name = $_POST['full_name'];
            $address = $_POST['address'];
            $mobile = $_POST['mobile'];
            $email = $_POST['email'];
            $note = $_POST['note'];
            $payment_method = $_POST['payment_method'];
            $error_status = false;

            if(empty($full_name) || empty($address) || empty($mobile) || empty($email)){
                $error_status = true;
            } else if(!is_numeric($mobile)){
                $error_status = true;
            } else if(!empty($email) && !filter_var($email, FILTER_VALIDATE_EMAIL)){
                $error_status = true;
            }

            if($error_status == false){
                $order_model = new Order();
                $order_model->full_name = $full_name;
                $order_model->address = $address;
                $order_model->phone_number = $mobile;
                $order_model->email = $email;
                $order_model->note = $note;
                $order_model->payment_method = $payment_method;

                $price_total = 0;
                foreach ($_SESSION['cart'] as $product_id => $cart) {
                    if(empty($product_variants[$product_id])){
                        $price_total += $cart['amount'] * $cart['price'];
                    } else {
                        foreach ($cart as $variant_value_id => $item){
                            $price_total += $item['amount'] * $item['price'];
                        }
                    }
                }
                $order_model->price_total = $price_total;
                $order_model->order_status = 0;
                $order_id = $order_model->insert();

                if ($order_id > 0) {
                    $order_detail_model = new OrderDetail();
                    $order_detail_model->order_id = $order_id;
                    $is_insert = '';

                    foreach ($_SESSION['cart'] AS $product_id => $cart) {
                        if(empty($product_variants[$product_id])){
                            $order_detail_model->product_id = $product_id;
                            $order_detail_model->amount = $cart['amount'];
                            $is_insert = $order_detail_model->insert();
                        } else {
                            foreach ($cart as $variant_value_id => $item){
                                $order_detail_model->product_id = $product_id;
                                $order_detail_model->variant_value_id = $variant_value_id;
                                $order_detail_model->amount = $item['amount'];
                                $is_insert = $order_detail_model->insert();
                            }
                        }
                    }

                    if($is_insert){
                        $order_detail = $_SESSION['cart'];
                        $date = date("d-m-Y H:i:s");

                        $_SESSION['success'] = 'Bạn đã đặt hàng thành công';
                        //tạo message để gửi mail cho kh vừa đặt hàng

                        $message = $this->view('views/checkouts/send_mail.php', [
                            'order_detail' => $order_detail,
                            'full_name' => $full_name,
                            'address' => $address,
                            'mobile' => $mobile,
                            'note' => $note,
                            'price_total' => $price_total,
                            'date' => $date,
                            'order_id' => $order_id,
                            'product_variants' => $product_variants
                        ]);

                        unset($_SESSION['cart']);
                        $_SESSION['check_order'] = true;

                        //gửi mail theo địa chỉ email của khách
                        $this->sendMail($email, $message);

//                    $url_redirect = $_SERVER['SCRIPT_NAME'] . '/thank';
                        header("Location: index.php?controller=checkout&action=thank");
                        exit();
                    } else {
                        $_SESSION['error'] = 'Lưu thông tin thanh toán thất bại';
//                    $url_redirect = $_SERVER['SCRIPT_NAME'] . '/payment';
                        header("Location: index.php?controller=checkout&action=index");
                        exit();
                    }
                } else {
                    $_SESSION['error'] = 'Lưu thông tin thanh toán thất bại';
//                    $url_redirect = $_SERVER['SCRIPT_NAME'] . '/payment';
                    header("Location: index.php?controller=checkout&action=index");
                    exit();
                }
            }
        }

        $this->content = $this->view('views/checkouts/index.php', [
            'product_variants' => $product_variants
        ]);
        require_once 'views/layouts/main_checkout.php';
    }

    public function buy_now(){
        $category_model = new Category();
        $categories = $category_model->getAllCategories();
        echo "<pre>";
        print_r($product_buy_now);
        echo "</pre>";
        echo "<pre>";
        print_r($product_variants);
        echo "</pre>";

        if(isset($_POST['order'])){
            $full_name = $_POST['full_name'];
            $address = $_POST['address'];
            $mobile = $_POST['mobile'];
            $email = $_POST['email'];
            $note = $_POST['note'];
            $error_status = false;

            if(empty($full_name) || empty($address) || empty($mobile) || empty($email)){
                $error_status = true;
            } else if(!is_numeric($mobile)){
                $error_status = true;
            } else if(!empty($email) && !filter_var($email, FILTER_VALIDATE_EMAIL)){
                $error_status = true;
            }

            if($error_status == false){
                $order_model = new Order();
                $order_model->full_name = $full_name;
                $order_model->address = $address;
                $order_model->phone_number = $mobile;
                $order_model->email = $email;
                $order_model->note = $note;

                $price_total = 0;
                foreach ($product_buy_now as $product_id => $cart) {
                    if(empty($product_variants)){
                        $price_total += $cart['amount'] * $cart['price'];
                    } else {
                        foreach ($cart as $variant_value_id => $item){
                            $price_total += $item['amount'] * $item['price'];
                        }
                    }
                }
                $order_model->price_total = $price_total;
                $order_model->order_status = 0;
                $order_id = $order_model->insert();

                if ($order_id > 0) {
                    $order_detail_model = new OrderDetail();
                    $order_detail_model->order_id = $order_id;
                    $is_insert = '';

                    foreach ($product_buy_now AS $product_id => $cart) {
                        if(empty($product_variants)){
                            $order_detail_model->product_id = $product_id;
                            $order_detail_model->amount = $cart['amount'];
                            $is_insert = $order_detail_model->insert();
                        } else {
                            foreach ($cart as $variant_value_id => $item){
                                $order_detail_model->product_id = $product_id;
                                $order_detail_model->variant_value_id = $variant_value_id;
                                $order_detail_model->amount = $item['amount'];
                                $is_insert = $order_detail_model->insert();
                            }
                        }
                    }

                    if($is_insert){
                        $order_detail = $product_buy_now;
                        $date = date("d-m-Y H:i:s");

                        $_SESSION['success'] = 'Bạn đã đặt hàng thành công';

                        //tạo message để gửi mail cho kh vừa đặt hàng
                        $message = $this->view('views/checkouts/send_mail_buynow.php', [
                            'order_detail' => $order_detail,
                            'full_name' => $full_name,
                            'address' => $address,
                            'mobile' => $mobile,
                            'note' => $note,
                            'price_total' => $price_total,
                            'date' => $date,
                            'order_id' => $order_id,
                            'product_variants' => $product_variants
                        ]);

                        unset($product_buy_now);
                        $_SESSION['check_order'] = true;

                        //gửi mail theo địa chỉ email của khách
                        $this->sendMail($email, $message);

//                    $url_redirect = $_SERVER['SCRIPT_NAME'] . '/thank';
                        header("Location: index.php?controller=checkout&action=thank");
                        exit();
                    } else {
                        $_SESSION['error'] = 'Lưu thông tin thanh toán thất bại';
//                    $url_redirect = $_SERVER['SCRIPT_NAME'] . '/payment';
                        header("Location: index.php?controller=checkout&action=buy_now");
                        exit();
                    }

                } else {
                    $_SESSION['error'] = 'Lưu thông tin thanh toán thất bại';
//                    $url_redirect = $_SERVER['SCRIPT_NAME'] . '/payment';
                    header("Location: index.php?controller=checkout&action=buy_now");
                    exit();
                }
            }
        }

        $this->content = $this->view('views/checkouts/buy_now.php');
        require_once 'views/layouts/main_checkout.php';
    }

    protected function sendMail($email, $message) {
        // Instantiation and passing `true` enables exceptions
        $mail = new \PHPMailer\PHPMailer\PHPMailer(true);

        try {
            //Server settings
//            $mail->SMTPDebug = \PHPMailer\PHPMailer\SMTP::DEBUG_SERVER;                      // Enable verbose debug output
            $mail->isSMTP();
            // Send using SMTP
            //host miễn phí của gmail
            $mail->Host       = 'smtp.gmail.com';                    // Set the SMTP server to send through
            $mail->SMTPAuth   = true;                                   // Enable SMTP authentication
            //username gmail của chính bạn
            $mail->Username   = 'darkprince411999@gmail.com';                     // SMTP username

            $mail->Password   = 'nnrduebxhljebqyw';                               // SMTP password
            $mail->SMTPSecure = \PHPMailer\PHPMailer\PHPMailer::ENCRYPTION_STARTTLS;         // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` also accepted
            $mail->Port       = 587;                                    // TCP port to connect to

            //email người gửi
            $mail->setFrom('darkprince411999@gmail.com', 'G10 Shop');

            //setting mail người nhận
            $mail->addAddress($email);     // Add a recipient

            $mail->isHTML(true); // Set email format to HTML
            $mail->CharSet = 'UTF-8';
            $mail->Subject = 'Thank you for your order!';
            $mail->Body    = $message;

            $mail->send();
            echo 'Message has been sent';
        } catch (Exception $e) {
            echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
        }
    }

    public function thank() {
        if(!isset($_SESSION['check_order']) || (isset($_SESSION['check_order']) && $_SESSION['check_order'] != true)){
            header("Location: index.php?controller=home");
            exit();
        }
        unset($_SESSION['check_order']);
        $category_model = new Category();
        $categories =  $category_model->getAllCategories();

        $this->content = $this->view('views/checkouts/thank.php');
        require_once 'views/layouts/main_checkout.php';
    }
}