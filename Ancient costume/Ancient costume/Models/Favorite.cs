//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Ancient_costume.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Favorite
    {
        public int Id { get; set; }
        public Nullable<int> MemberId { get; set; }
        public Nullable<int> JourneyId { get; set; }
    
        public virtual Member Member { get; set; }
        public virtual Journey Journey { get; set; }
    }
}
