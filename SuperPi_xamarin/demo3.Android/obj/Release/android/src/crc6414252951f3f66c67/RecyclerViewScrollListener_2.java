package crc6414252951f3f66c67;


public class RecyclerViewScrollListener_2
	extends android.support.v7.widget.RecyclerView.OnScrollListener
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onScrolled:(Landroid/support/v7/widget/RecyclerView;II)V:GetOnScrolled_Landroid_support_v7_widget_RecyclerView_IIHandler\n" +
			"";
		mono.android.Runtime.register ("Xamarin.Forms.Platform.Android.CollectionView.RecyclerViewScrollListener`2, Xamarin.Forms.Platform.Android", RecyclerViewScrollListener_2.class, __md_methods);
	}


	public RecyclerViewScrollListener_2 ()
	{
		super ();
		if (getClass () == RecyclerViewScrollListener_2.class)
			mono.android.TypeManager.Activate ("Xamarin.Forms.Platform.Android.CollectionView.RecyclerViewScrollListener`2, Xamarin.Forms.Platform.Android", "", this, new java.lang.Object[] {  });
	}


	public void onScrolled (android.support.v7.widget.RecyclerView p0, int p1, int p2)
	{
		n_onScrolled (p0, p1, p2);
	}

	private native void n_onScrolled (android.support.v7.widget.RecyclerView p0, int p1, int p2);

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
