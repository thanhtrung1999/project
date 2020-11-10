<?php
require_once "controllers/Controller.php";
require_once "models/Product.php";
require_once "models/Category.php";
require_once "models/Pagination.php";

class ProductController extends Controller {
    public function index()
    {
        $product_model = new Product();
        $count_total = $product_model->countTotal();
        $query_additional = '';
        if (isset($_GET['product_name'])) {
            $query_additional .= '&product_name=' . $_GET['product_name'];
        }
        if (isset($_GET['category_id'])) {
            $query_additional .= '&category_id=' . $_GET['category_id'];
        }
        if (isset($_GET['brand_id'])) {
            $query_additional .= '&brand_id=' . $_GET['brand_id'];
        }
        
        $arr_params = [
            'total' => $count_total,
            'limit' => 10,
            'query_string' => 'page',
            'controller' => 'product',
            'action' => 'index',
            'query_additional' => $query_additional,
            'page' => isset($_GET['page']) ? $_GET['page'] : 1
        ];
        $products = $product_model->getAllPagination($arr_params);
        
        $pagination = new Pagination($arr_params);
        $pages = $pagination->getPagination();
        
        $category_model = new Category();
        $categories = $category_model->getAll();
        $brands = $product_model->getAllBrands();

        $this->content = $this->view('views/products/index.php', [
            'products' => $products,
            'categories' => $categories,
            'brands' => $brands,
            'pages' => $pages,
        ]);
        require_once 'views/layouts/main.php';
    }

    public function create()
    {
        if (isset($_POST['submit'])) {
            $category_id = $_POST['category_id'];
            $brand_id = $_POST['brand_id'];
            $name = $_POST['product_name'];
            $price = $_POST['price'];
            $summary = $_POST['summary'];
            $description = $_POST['description'];
            $variant_name = isset($_POST['variant_name']) ? $_POST['variant_name'] : [];
            $variant_value = isset($_POST['variant_value']) ? $_POST['variant_value'] : [];
            $status = $_POST['status'];

            if (empty($name)) {
                $this->error = 'Tên sản phẩm không được để trống';
            } else if(empty($category_id) || $category_id == 0) {
                $this->error = 'Danh mục bắt buộc phải chọn';
            } else if(empty($brand_id) || $brand_id == 0) {
                $this->error = 'Hãng bắt buộc phải chọn';
            } else if ($_FILES['avatar']['error'] == 0) {
                $extension = pathinfo($_FILES['avatar']['name'], PATHINFO_EXTENSION);
                $extension = strtolower($extension);
                $arr_extension = ['jpg', 'jpeg', 'png', 'gif', 'webp'];

                $file_size_mb = $_FILES['avatar']['size'] / 1024 / 1024;
                $file_size_mb = round($file_size_mb, 2);

                if (!in_array($extension, $arr_extension)) {
                    $this->error = 'Cần upload file định dạng ảnh';
                } else if ($file_size_mb > 2) {
                    $this->error = 'File upload không được quá 2MB';
                }
            } else if(isset($variant_name) && isset($variant_value)){
                foreach ($variant_name as $v_name) {
                    if (empty($v_name)) {
                        $this->error = 'Tên biến thể không được để trống';
                    } else {
                        foreach ($variant_value as $v_variant){
                            if(empty($v_variant)){
                                $this->error = 'Giá trị biến thể không được để trống';
                            }
                        }
                    }
                }
            }

            if (empty($this->error)) {
                $filename = '';

                if ($_FILES['avatar']['error'] == 0) {
                    $dir_uploads = __DIR__ . '/../assets/uploads';
                    if (!file_exists($dir_uploads)) {
                        mkdir($dir_uploads);
                    }

                    $filename = time() . '-product-' . $_FILES['avatar']['name'];
                    move_uploaded_file($_FILES['avatar']['tmp_name'], $dir_uploads . '/' . $filename);
                }

                $product_model = new Product();
                $product_model->category_id = $category_id;
                $product_model->brand_id = $brand_id;
                $product_model->name = $name;
                $product_model->avatar = $filename;
                $product_model->price = $price;
                $product_model->summary = $summary;
                $product_model->description = $description;
                $product_model->status = $status;
                $product_id = $product_model->insert();

                if($product_id > 0){
                    if(isset($variant_name) && !empty($variant_name)){
                        if(isset($variant_value) && !empty($variant_value)){
                            $variants_arr = array_combine($variant_name, $variant_value);
                            foreach ($variants_arr as $variant_name => $variant_value){
                                $variants_arr_explode= [
                                    $variant_name => explode(', ',$variant_value)
                                ];

                                $check_variant_name_exist = $product_model->getVariantName($variant_name);
                                if(empty($check_variant_name_exist)){
                                    $variant_id = $product_model->insertVariantName($variant_name);
                                    foreach ($variants_arr_explode as $value_ex){
                                        foreach ($value_ex as $value){
                                            $check_variant_value_exist = $product_model->getVariantValue($value);
                                            if(empty($check_variant_value_exist)) {
                                                $variant_value_id = $product_model->insertVariantValue($variant_id, $value);
                                                $product_model->insertProductVariants($product_id, $variant_value_id);
                                            } else {
                                                $variant_value_id = $check_variant_value_exist['id'];
                                                $product_model->insertProductVariants($product_id, $variant_value_id);
                                            }
                                        }
                                    }
                                } else {
                                    $variant_id = $check_variant_name_exist['id'];
                                    foreach ($variants_arr_explode as $value_ex){
                                        foreach ($value_ex as $value){
                                            $check_variant_value_exist = $product_model->getVariantValue($value);
                                            if(empty($check_variant_value_exist)) {
                                                $variant_value_id = $product_model->insertVariantValue($variant_id, $value);
                                                $product_model->insertProductVariants($product_id, $variant_value_id);
                                            } else {
                                                $variant_value_id = $check_variant_value_exist['id'];
                                                $product_model->insertProductVariants($product_id, $variant_value_id);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    $_SESSION['success'] = 'Thêm sản phẩm thành công';
                } else {
                    $_SESSION['error'] = 'Thêm sản phẩm thất bại';
                }
                header('Location: index.php?controller=product');
                exit();
            }
        }
        $product_model_2 = new Product();

        $category_model = new Category();
        $categories = $category_model->getAll();
        $brands = $product_model_2->getAllBrands();

        $this->content = $this->view('views/products/create.php', [
            'categories' => $categories,
            'brands' => $brands
        ]);
        require_once 'views/layouts/main.php';
    }

    public function detail()
    {
        if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
            $_SESSION['error'] = 'ID không hợp lệ';
            header('Location: index.php?controller=product');
            exit();
        }

        $id = $_GET['id'];
        $product_model = new Product();
        $product = $product_model->getById($id);
        $product_variants = $product_model->getProductVariants($id);

        $this->content = $this->view('views/products/detail.php', [
            'product' => $product,
            'product_variants' => $product_variants
        ]);
        require_once 'views/layouts/main.php';
    }

    public function update()
    {
        if(isset($_SESSION['manager']) && $_SESSION['manager']['level'] == 1){
            $_SESSION['error'] = 'Member không có quyền sửa sản phẩm';
            header("Location: index.php?controller=product");
            exit();
        }
        if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
            $_SESSION['error'] = 'ID không hợp lệ';
            header('Location: index.php?controller=product');
            exit();
        }

        $id = $_GET['id'];
        $product_model = new Product();
        $product = $product_model->getById($id);
        $product_variants = $product_model->getProductVariants($id);

        if (isset($_POST['submit'])) {
            $category_id = $_POST['category_id'];
            $brand_id = $_POST['brand_id'];
            $name = $_POST['product_name'];
            $price = $_POST['price'];
            $summary = $_POST['summary'];
            $description = $_POST['description'];
            $variant_name = isset($_POST['variant_name']) ? $_POST['variant_name'] : [];
            $variant_value = isset($_POST['variant_value']) ? $_POST['variant_value'] : [];
            $status = $_POST['status'];

            if (empty($name)) {
                $this->error = 'Tên sản phẩm không được để trống';
            } else if(empty($category_id) || $category_id == 0){
                $this->error = 'Danh mục bắt buộc phải chọn';
            } else if(empty($brand_id) || $brand_id == 0){
                $this->error = 'Hãng bắt buộc phải chọn';
            } else if ($_FILES['avatar']['error'] == 0) {
                $extension = pathinfo($_FILES['avatar']['name'], PATHINFO_EXTENSION);
                $extension = strtolower($extension);
                $arr_extension = ['jpg', 'jpeg', 'png', 'gif', 'webp'];

                $file_size_mb = $_FILES['avatar']['size'] / 1024 / 1024;
                $file_size_mb = round($file_size_mb, 2);

                if (!in_array($extension, $arr_extension)) {
                    $this->error = 'Cần upload file định dạng ảnh';
                } else if ($file_size_mb > 2) {
                    $this->error = 'File upload không được quá 2MB';
                }
            } else if(isset($variant_name) && isset($variant_value)){
                foreach ($variant_name as $v_name) {
                    if (empty($v_name)) {
                        $this->error = 'Tên biến thể không được để trống';
                    } else {
                        foreach ($variant_value as $v_variant){
                            if(empty($v_variant)){
                                $this->error = 'Giá trị biến thể không được để trống';
                            }
                        }
                    }
                }
            }

            if (empty($this->error)) {
                $filename = $product['avatar'];

                if ($_FILES['avatar']['error'] == 0) {
                    $dir_uploads = __DIR__ . '/../assets/uploads';
                    @unlink($dir_uploads . '/' . $filename);
                    if (!file_exists($dir_uploads)) {
                        mkdir($dir_uploads);
                    }
                    $filename = time() . '-product-' . $_FILES['avatar']['name'];
                    move_uploaded_file($_FILES['avatar']['tmp_name'], $dir_uploads . '/' . $filename);
                }

                $product_model->category_id = $category_id;
                $product_model->brand_id = $brand_id;
                $product_model->name = $name;
                $product_model->avatar = $filename;
                $product_model->price = $price;
                $product_model->summary = $summary;
                $product_model->description = $description;
                $product_model->status = $status;
                $product_model->updated_at = date('Y-m-d H:i:s');
                $is_update = $product_model->update($id);
                if ($is_update) {
                    if(isset($variant_name) && !empty($variant_name)){
                        if (isset($variant_value) && !empty($variant_value)){
                            $variants_arr = array_combine($variant_name, $variant_value);
                            foreach ($variants_arr as $variant_name => $variant_value){
                                $variants_arr_explode= [
                                    $variant_name => explode(', ',$variant_value)
                                ];

                                $check_variant_name_exist = $product_model->getVariantName($variant_name);
                                if(empty($check_variant_name_exist)){
                                    $variant_id = $product_model->insertVariantName($variant_name);
                                    foreach ($variants_arr_explode as $value_ex){
                                        foreach ($value_ex as $value){
                                            $check_variant_value_exist = $product_model->getVariantValue($value);
                                            if(empty($check_variant_value_exist)) {
                                                $variant_value_id = $product_model->insertVariantValue($variant_id, $value);
                                                $product_model->insertProductVariants($id, $variant_value_id);
                                            } else {
                                                $variant_value_id = $check_variant_value_exist['id'];
                                                $product_model->insertProductVariants($id, $variant_value_id);
                                            }
                                        }
                                    }
                                } else {
                                    $variant_id = $check_variant_name_exist['id'];
                                    foreach ($variants_arr_explode as $value_ex){
                                        foreach ($value_ex as $value){
                                            $check_variant_value_exist = $product_model->getVariantValue($value);
                                            if(empty($check_variant_value_exist)) {
                                                $variant_value_id = $product_model->insertVariantValue($variant_id, $value);
                                                $product_model->insertProductVariants($id, $variant_value_id);
                                            } else {
                                                $variant_value_id = $check_variant_value_exist['id'];
                                                $product_model->insertProductVariants($id, $variant_value_id);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    $_SESSION['success'] = 'Cập nhật sản phẩm thành công';
                } else {
                    $_SESSION['error'] = 'Cập nhật sản phẩm  thất bại';
                }
                header('Location: index.php?controller=product');
                exit();
            }
        }

        $category_model = new Category();
        $categories = $category_model->getAll();
        $brands = $product_model->getAllBrands();

        $this->content = $this->view('views/products/update.php', [
            'categories' => $categories,
            'brands' => $brands,
            'product' => $product,
            'product_variants' => $product_variants
        ]);
        require_once 'views/layouts/main.php';
    }

    public function delete() {
        if(isset($_SESSION['manager']) && $_SESSION['manager']['level'] == 1){
            $_SESSION['error'] = 'Member không có quyền xóa sản phẩm';
            header("Location: index.php?controller=product");
            exit();
        }
        if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
            $_SESSION['error'] = 'ID không hợp lệ';
            header('Location: index.php?controller=product');
            exit();
        }

        $id = $_GET['id'];
        $product_model = new Product();
        $is_delete = $product_model->delete($id);
        if ($is_delete) {
            $_SESSION['success'] = 'Xóa sản phẩm thành công';
        } else {
            $_SESSION['error'] = 'Xóa sản phẩm thất bại';
        }
        header('Location: index.php?controller=product');
        exit();
    }

    public function brands() {
        $product_model = new Product();
        $brands = $product_model->getAllBrands();

        if(isset($_POST['submit'])){
            if(isset($_POST['brand_name'])){
                $brand_name_list = $_POST['brand_name'];
                foreach ($brand_name_list as $brand_name){
                    if(empty($brand_name)){
                        $this->error = "Tên hãng không được để trống";
                    } else {
                        $check_brand_name_exist = $product_model->getBrandName($brand_name);
                        if(!empty($check_brand_name_exist)){
                            $_SESSION['error'] = 'Hãng đã tồn tại';
                        } else {
                            $is_insert_brand = $product_model->insertBrand($brand_name);
                            if($is_insert_brand){
                                $_SESSION['success'] = 'Cập nhật hãng thành công';
                            } else {
                                $_SESSION['error'] = 'Cập nhật hãng thất bại';
                            }
                            header("Location: index.php?controller=product");
                            exit();
                        }
                    }
                }
            } else {
                $_SESSION['error'] = 'Vui lòng thêm hãng trước khi cập nhật, ấn Back để quay lại';
            }
        }

        $this->content = $this->view('views/products/brands.php', [
            'brands' => $brands
        ]);
        require_once 'views/layouts/main.php';
    }

    public function delete_brand(){
        if(isset($_SESSION['manager']) && $_SESSION['manager']['level'] == 1){
            $_SESSION['error'] = 'Member không có quyền xóa thương hiệu';
            header("Location: index.php?controller=category");
            exit();
        }
        if(!isset($_GET['brand_id']) || !is_numeric($_GET['brand_id'])){
            $_SESSION['error'] = "ID không hợp lệ";
            header('Location: index.php?controller=product');
            exit();
        }

        $brand_id = $_GET['brand_id'];

        $product_model = new Product();
        $is_delete = $product_model->deleteBrand($brand_id);

        if ($is_delete) {
            $_SESSION['success'] = 'Xóa hãng thành công';
        } else {
            $_SESSION['error'] = 'Xóa hãng thất bại';
        }
        header('Location: index.php?controller=product&action=brands');
        exit();
    }

    public function delete_variant(){
        if(!isset($_POST['product_id']) || !is_numeric($_POST['product_id'])){
            $_SESSION['error'] = "ID ko hợp lệ";
            header('Location: index.php?controller=product');
            exit();
        }

        $product_id = $_POST['product_id'];
        $variant_value_id = $_POST['variant_value_id'];

        $product_model = new Product();
        $product_model->deleteVariantValue($product_id, $variant_value_id);
    }
}