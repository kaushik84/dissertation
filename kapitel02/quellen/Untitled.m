   colormap(cool(6));
   pie(rand(6,1));
   legend('Jan','Feb','Mar','Apr','May','Jun');
   im_hatch = applyhatch_pluscolor(gcf,'|-.+\/',1,[1 1 0 1 0 0],cool(6),200,3,2);
   imwrite(im_hatch,'im_hatch.png','png')