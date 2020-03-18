package crc643f46942d9dd1fff9;


public class ScrollHelper
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
		mono.android.Runtime.register ("Xamarin.Forms.Platform.Android.ScrollHelper, Xamarin.Forms.Platform.Android", ScrollHelper.class, __md_methods);
	}


	public ScrollHelper ()
	{
		super ();
		if (getClass () == ScrollHelper.class)
			mono.android.TypeManager.Activate ("Xamarin.Forms.Platform.Android.ScrollHelper, Xamarin.Forms.Platform.Android", "", this, new java.lang.Object[] {  });
	}

	public ScrollHelper (android.support.v7.widget.RecyclerView p0)
	{
		super ();
		if (getClass () == ScrollHelper.class)
			mono.android.TypeManager.Activate ("Xamarin.Forms.Platform.Android.ScrollHelper, Xamarin.Forms.Platform.Android", "Android.Support.V7.Widget.RecyclerView, Xamarin.Android.Support.v7.RecyclerView", this, new java.lang.Object[] { p0 });
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
