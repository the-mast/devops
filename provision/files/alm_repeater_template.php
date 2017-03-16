<div class="related-story">
    <div class="related-story-title">
        <h3><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h3>
        <div class="related-story-excerpt"><?php
            $sentence = preg_split( '/(\.|!|\?)\s/', strip_tags( get_the_content()), 2, PREG_SPLIT_DELIM_CAPTURE );
            echo $sentence[0]; ?>
        </div>
    </div>
    <div class="related-story-image">
        <a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('thumbnail'); ?></a>
    </div>
    <div class="related-story-date">
        <?php the_time('jS F Y') ?>
    </div>
</div>