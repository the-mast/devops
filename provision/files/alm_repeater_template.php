<?php if(!empty (get_the_post_thumbnail())): ?>
<div class="related-story">
    <div class="related-story-title title">
        <?php	foreach ($categories as $cat):
            if( !in_array($cat->term_id, $excludes)) :
                $category_link = get_category_link( $cat->term_id );
                echo '<a href="' . esc_html($category_link) . '"><span>' . esc_html( $cat->name ) . '</span> </a>';
                echo ' ';
            endif;
        endforeach ?>
        <h3 class="archive-title"><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h3>
        <div class="related-story-excerpt">
            <?php	echo $sentence[0]; ?>
        </div>
    </div>
    <div class="related-story-image">
        <a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('thumbnail'); ?></a>
    </div>
    <div class="related-story-date">
        <?php the_time('jS F Y') ?>
    </div>
</div>
<?php
else: ?>
<div class="related-story">
    <div class="full-length-title title">
        <?php
        foreach ($categories as $cat):
        if( !in_array($cat->term_id, $excludes)) :
        $category_link = get_category_link( $cat->term_id );
        echo '<a href="' . esc_html($category_link) . '"><span>' . esc_html( $cat->name ) . '</span> </a>';
        echo ' ';
        endif;
        endforeach ?>
        <h3 class="archive-title"><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h3>
        <div class="related-story-excerpt">
            <?php	echo $sentence[0]; ?>
        </div>
        <div class="related-story-date">
            <?php the_time('jS F Y') ?>
        </div>
    </div>
</div>
<?php endif; ?>