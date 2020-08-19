<?php
require_once 'controllers/Controller.php';
require_once 'models/Order.php';
require_once 'models/Pagination.php';

class OrderController extends Controller
{
    public function index(){
        $order_model = new Order();
        $page = isset($_GET['page']) ? $_GET['page'] : 1;
        $total = $order_model->getTotal();
        $query_additional = '';
        if (isset($_GET['product_name'])) {
            $query_additional .= '&product_name=' . $_GET['product_name'];
        }
        if (isset($_GET['order_id'])) {
            $query_additional .= '&order_id=' . $_GET['order_id'];
        }
        if (isset($_GET['customer_name'])) {
            $query_additional .= '&customer_name=' . $_GET['customer_name'];
        }
//        $params = [
//            'total' => $total,
//            'limit' => 10,
//            'query_string' => 'page',
//            'controller' => 'order',
//            'action' => 'index',
//            'page' => $page,
//            'query_additional' => $query_additional
//        ];
//        $pagination = new Pagination($params);
//        $pages = $pagination->getPagination();
        $orders = $order_model->getAll();

        $this->content = $this->view('views/orders/index.php', [
            'orders' => $orders,
        ]);

        require_once 'views/layouts/main.php';
    }

    public function handle(){
//        if(!isset($_POST['order_id']) || !is_numeric($_GET['order_id'])){
//            $_SESSION['error'] = 'ID không hợp lệ';
//            header('Location: index.php?controller=order');
//            exit();
//        }

        $id = $_GET['order_id'];
        $order_model = new Order();
        $order = $order_model->getOrderById($id);

        if($order['order_status'] == 1){
            $_SESSION['error'] = 'Đơn hàng này đã được xử lí';
        } else {
            $is_handle = $order_model->handleOrders($id);
            if ($is_handle) {
                $_SESSION['success'] = 'Xử lí đơn hàng thành công';
            } else {
                $_SESSION['error'] = 'Xử lí đơn hàng thất bại';
            }
        }
        header('Location: index.php?controller=order');
        exit();
    }

    public function delete(){
        if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
            $_SESSION['error'] = 'ID không hợp lệ';
            header('Location: index.php?controller=orders');
            exit();
        }

        $id = $_GET['id'];
        $orders_model = new Order();
        $is_delete = $orders_model->deleteOrders($id);
        if ($is_delete) {
            $_SESSION['success'] = 'Xóa đơn hàng thành công';
        } else {
            $_SESSION['error'] = 'Xóa đơn hàng thất bại';
        }
        header('Location: index.php?controller=order');
        exit();
    }
}