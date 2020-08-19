<?php if(!empty($slides)):?>
<section class="slides">
    <div class="slides__elem">
        <?php foreach ($slides as $slide):?>
            <div class="slide-item">
                <div class="slide-item__textbox">
                    <h1 class="slide-item__heading"><?= $slide['heading']?></h1>
                    <p class="slide-item__text"><?= $slide['text']?></p>
                </div>
                <img class="d-block w-100 slide-item__image" src="../backend/assets/uploads/<?= $slide['image']?>">
            </div>
        <?php endforeach;?>
    </div>
</section>
<?php endif;?>