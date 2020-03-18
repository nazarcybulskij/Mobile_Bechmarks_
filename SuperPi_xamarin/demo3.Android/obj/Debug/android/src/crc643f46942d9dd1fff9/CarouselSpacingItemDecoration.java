package crc643f46942d9dd1fff9;


public class CarouselSpacingItemDecoration
	extends android.support.v7.widget.RecyclerView.ItemDecoration
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onDraw:(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V:GetOnDraw_Landroid_graphics_Canvas_Landroid_support_v7_widget_RecyclerView_Landroid_support_v7_widget_RecyclerView_State_Handler\n" +
			"n_getItemOffsets:(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V:GetGetItemOffsets_Landroid_graphics_Rect_Landroid_view_View_Landroid_support_v7_widget_RecyclerView_Landroid_support_v7_widget_RecyclerView_State_Handler\n" +
			"";
		mono.android.Runtime.register ("Xamarin.Forms.Platform.Android.CarouselSpacingItemDecoration, Xamarin.Forms.Platform.Android", CarouselSpacingItemDecoration.class, __md_methods);
	}


	public CarouselSpacingItemDecoration ()
	{
		super ();
		if (getClass () == CarouselSpacingItemDecoration.class)
			mono.android.TypeManager.Activate ("Xamarin.Forms.Platform.Android.CarouselSpacingItemDecoration, Xamarin.Forms.Platform.Android", "", this, new java.lang.Object[] {  });
	}


	public void onDraw (android.graphics.Canvas p0, android.support.v7.widget.RecyclerView p1, android.support.v7.widget.RecyclerView.State p2)
	{
		n_onDraw (p0, p1, p2);
	}

	private native void n_onDraw (android.graphics.Canvas p0, android.support.v7.widget.RecyclerView p1, android.support.v7.widget.RecyclerView.State p2);


	public void getItemOffsets (android.graphics.Rect p0, android.view.View p1, android.support.v7.widget.RecyclerView p2, android.support.v7.widget.RecyclerView.State p3)
	{
		n_getItemOffsets (p0, p1, p2, p3);
	}

	private native void n_getItemOffsets (android.graphics.Rect p0, android.view.View p1, android.support.v7.widget.RecyclerView p2, android.support.v7.widget.RecyclerView.State p3);

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
